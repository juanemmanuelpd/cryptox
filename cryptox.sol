// License

// SPDX-License-Identifier: LGPL-3.0-only

// Version

pragma solidity 0.8.24;

// Libraries

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

// Contracts

contract cryptox is ERC20, Pausable {

    // Variables
    
    address internal owner;
    uint256 internal maxtokens = 100000;
    uint256 internal mintokens = 100;
    uint256 internal totalsupplyctx;

    // Modifiers
    
    modifier permission(){
        if (msg.sender != owner) revert("Only the owner of the token can perform this operation.");
        _;       
    }

    modifier maximumsupply(){
        totalsupplyctx = totalSupply();
        if ( totalsupplyctx > 1000000 * 1e18) revert("The maximum amount of tokens in circulation is 1,000,000");
        _;
    }

    // Events

    event mintctx(address account, uint256 value);
    event burnctx(address account, uint256 value);
    event multitransferctx(address sender, address to1_, address to2_, address to3_, uint256 value);

    // Functions

    constructor (string memory name_, string memory symbol_) ERC20 (name_, symbol_){
        owner = msg.sender;
        _mint(msg.sender, 10000 * 1e18);
    }
    
    function mint(address account_, uint256 value_) public permission maximumsupply whenNotPaused {
        if (value_ > maxtokens) revert("The maximum amount is 100,000 tokens");
        if (value_ < mintokens) revert("The minimum amount is 100 token");
        _mint(account_, value_ * 1e18);
        emit mintctx(account_, value_);
    }

    function burn(address account_, uint256 value_) public permission whenNotPaused {
        if (value_ > maxtokens) revert("The maximum amount is 100,000 tokens");
        _burn(account_, value_ * 1e18);
        emit burnctx(account_, value_);        
    }

    function multitransfer(address to1_, address to2_, address to3_, uint256 value_) public whenNotPaused {
        _transfer(msg.sender, to1_, value_ * 1e18);
        _transfer(msg.sender, to2_, value_ * 1e18);
        _transfer(msg.sender, to3_, value_ * 1e18);
        emit multitransferctx(msg.sender, to1_, to2_, to3_, value_);
    }

    function pausetransactions() public permission{
        _pause();
    }

    function unpausetransactions() public permission(){
        _unpause();
    }

}
