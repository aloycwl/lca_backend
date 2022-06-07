
pragma solidity>0.8.0;//SPDX-License-Identifier:None
import"https://github.com/aloycwl/ERC_AC/blob/main/ERC721AC/ERC721AC.sol";
contract ERC721_LSG is ERC721AC{
    uint public count;
    function name()external pure override returns(string memory){
        return"Lunatic Support Group";
    }
    function symbol()external pure override returns(string memory){
        return"LSG";
    }
    function tokenURI(uint a)external pure override returns(string memory){
        return string(abi.encodePacked("ipfs://",a));
    }
    function MINT(uint n)external{unchecked{
        require(_balances[msg.sender]+n<6);
        require(count<3334);
        for(uint i=0;i<n;i++){
            (count++,_balances[msg.sender]+= 1,_owners[count]=msg.sender);
            emit Transfer(address(0),msg.sender,count);
        }
    }}
}