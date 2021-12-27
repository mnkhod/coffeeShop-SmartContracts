const CoffeeShopContract = artifacts.require("CoffeeShop");

module.exports = function(deployer) {
  deployer.deploy(CoffeeShopContract);
};
