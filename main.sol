
pragma solidity>0.8.0;//SPDX-License-Identifier:None
import"https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
contract ERC721_LSG is ERC721{
    uint public count;
    mapping(uint=>string)private _uri;
    constructor(string memory _name,string memory _symbol,string[] memory uri,uint[]memory num)ERC721(_name,_symbol){
        for(uint i=0;i<uri.length;i++)_uri[num[i]]=uri[i];
    }
    function tokenURI(uint a)public view override returns(string memory){
        return string(abi.encodePacked("ipfs://",_uri[a]));
    }
    function MINT(string[] memory r)external{unchecked{
        require(r.length<6);
        require(count<3334);
        require(balanceOf(msg.sender)+r.length<6);
        for(uint i=0;i<r.length;i++){
            count++;
            if(bytes(_uri[count]).length<1)_uri[count]=r[i];
            _mint(msg.sender,count);
        }
    }}
}
// ["QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/8.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/69.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/188.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/424.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/666.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/823.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/967.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/1316.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/2022.json","QmZAmBtadVezuFj3u3BvZPQZ3Jc9XhdD7TrxpNJbzNyX83/3278.json"]
// [8,69,188,424,666,823,967,1316,2022,3278]