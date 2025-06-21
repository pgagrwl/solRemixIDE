// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract Base{
    uint8 public myNum;

    function setNum(uint8 _val) public virtual{
        myNum = _val;
    }

    function getnum() public view returns(uint8){
        return myNum;
    }
}

contract Override is Base{
    function setNum(uint8 _newNum)public override{
        myNum = _newNum;
    }
}