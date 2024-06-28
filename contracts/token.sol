// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MyToken {
    address public owner;
    string public name = "Medi Buddy Token";
    string public symbol = "MBT";
    uint8 public decimals = 0;
    uint256 public totalSupply;

    mapping(address => uint256) private balance;
    mapping(address => mapping(address => uint256)) private allowed;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor(uint256 _initialSupply) {
        owner = msg.sender;
        mint(owner, _initialSupply);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balance[_owner];
    }

    function allowance(
        address _owner,
        address _spender
    ) public view returns (uint256) {
        return allowed[_owner][_spender];
    }

    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_to != address(0), "Invalid address");
        require(balance[msg.sender] >= _value, "Not enough balance");

        balance[msg.sender] -= _value;
        balance[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_from != address(0) && _to != address(0), "Invalid address");
        require(allowed[_from][msg.sender] >= _value, "Not enough allowance");
        require(balance[_from] >= _value, "Not enough balance");

        balance[_from] -= _value;
        balance[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function mint(address _to, uint256 _value) public onlyOwner {
        require(_to != address(0), "Invalid address");
        balance[_to] += _value;
        totalSupply += _value;
        emit Transfer(address(0), _to, _value);
    }

    function burn(uint256 _value) public {
        require(balance[msg.sender] >= _value, "Not enough balance");
        balance[msg.sender] -= _value;
        totalSupply -= _value;
        emit Transfer(msg.sender, address(0), _value);
    }
}
