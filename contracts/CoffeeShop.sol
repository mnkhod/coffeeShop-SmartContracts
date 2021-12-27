// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CoffeeShop is Ownable{
	using EnumerableSet for EnumerableSet.AddressSet;
    address public shopAddress;	

	EnumerableSet.AddressSet private workers;

	function addWorker(address worker) public onlyOwner{
        require(!EnumerableSet.contains(workers, worker),"User is already requested");

		EnumerableSet.add(workers,worker);
	}

	function removeWorker(address worker) public onlyOwner{
		require(EnumerableSet.contains(workers, worker),"There isnt any user.");

		EnumerableSet.remove(workers,worker);
	}

	function isWorker(address worker) public view returns(bool) {
		if(EnumerableSet.contains(workers, worker)){
			return true;
		}

		return false;
	}

    function setShopAddress(address _address) public onlyOwner{
        require(_address != address(0),"Address empty");

        shopAddress = _address;
    }


    function getAllOwners() public onlyOwner view returns(address[] memory){
        return EnumerableSet.values(workers);
    }

}