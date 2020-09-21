pragma solidity ^0.5.16;

import "./CErc20Delegate.sol";

interface CompLike {
  function delegate(address delegatee) external;
}

/**
 * @title Compound's CCompLikeDelegate Contract
 * @notice CTokens which can 'delegate votes' of their underlying ERC-20
 * @author Compound
 */
contract CCompLikeDelegate is CErc20Delegate {
  /**
   * @notice Construct an empty delegate
   */
  constructor() public CErc20Delegate() {}

  /**
   * @notice Admin call to delegate the votes of the underlying
   * @param delegatee The address to delegate votes to
   */
  function _delegateTo(address delegatee) external {
    require(msg.sender == admin, "only the admin may call _delegate");
    CompLike(underlying).delegate(delegatee);
  }
}
