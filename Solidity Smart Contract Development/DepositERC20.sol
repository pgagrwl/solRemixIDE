//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

contract Deposit{

    IERC20 public token1;

    constructor(
        address _token1
    ) {
        token1 = IERC20(_token1);
    }
    function receiveFunds(uint _amt) public{
        // ERC20 myERC = ERC20(_addr);
        // IERC20.balanceOf(address(this)) =  (IERC20.transferFrom(_addr, address(this),_amt));
        // IERC20(token1).allowance(msg.sender,address(this));
        IERC20(token1).approve(address(this),_amt);
        IERC20(token1).transferFrom(tx.origin,address(this),_amt);
    }
    function getBalance() public view returns (uint){
        return IERC20(token1).balanceOf(address(this));
    }

    // function _safeTransferFrom(
    //     IERC20 token,
    //     address sender,
    //     address recipient,
    //     uint256 amount
    // ) public {
    //     bool sent = token.transferFrom(sender, recipient, amount);
    //     require(sent, "Token transfer failed");
    // }
}