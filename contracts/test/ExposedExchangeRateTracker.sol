/**
Copyright 2020 PoolTogether Inc.

This file is part of PoolTogether.

PoolTogether is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation under version 3 of the License.

PoolTogether is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with PoolTogether.  If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity 0.5.12;

import "../ExchangeRateTracker.sol";
import "../FixedPoint.sol";

contract ExposedExchangeRateTracker {
  using ExchangeRateTracker for ExchangeRateTracker.State;

  ExchangeRateTracker.State state;

  function search(uint256 drawId) external view returns (uint256) {
    return state.search(drawId);
  }

  function setExchangeRateTracker(uint256[] calldata drawIds) external {
    state.exchangeRates.length = 0;
    for (uint256 i = 0; i < drawIds.length; i++) {
      state.exchangeRates.push(ExchangeRateTracker.ExchangeRate(drawIds[i], FixedPoint.Fixed18(0)));
    }
  }

  function get(uint256 index) external view returns (uint256) {
    return state.exchangeRates[index].timestamp;
  }
}