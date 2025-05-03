//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public listOfSimpleStorageContracts;
    address[] addr;

    function deploySimpleStorage() public{
       SimpleStorage simpleStorage = new SimpleStorage();
       listOfSimpleStorageContracts.push(simpleStorage);
       addr.push(address(simpleStorage));
    }

    function sfStore(uint _index,uint _newNumber) public{
        SimpleStorage mySS = SimpleStorage(addr[_index]) ;
        mySS.store( _newNumber);
    }

    function getsfStore(uint _index) public view returns(uint){
        SimpleStorage mySS = SimpleStorage(addr[_index]) ;
        return mySS.retrieve();
    }
}