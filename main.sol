
pragma solidity>0.8.0;//SPDX-License-Identifier:None
import"https://github.com/aloycwl/ERC_AC/blob/main/ERC721AC/ERC721AC.sol";
contract ERC721AC_Luna is ERC721AC{
    uint public count;
    mapping(uint=>string)private _uri;
    function name()external pure override returns(string memory){return"Lunatic Support Group";}
    function symbol()external pure override returns(string memory){return"LSG";}
    function tokenURI(uint a)external view override returns(string memory){
        return string(abi.encodePacked("ipfs://",_uri[a]));
    }
    function MINT(string[] memory r)external{unchecked{
        require(r.length<6);
        require(count<3334);
        for(uint i=0;i<r.length;i++){
            (_owners[count]=msg.sender,_balances[msg.sender]+=1,_uri[count]=r[i]);
            emit Transfer(address(0),msg.sender,count);
            count++;
        }
    }}
}