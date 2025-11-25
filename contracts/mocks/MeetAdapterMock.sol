// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { MeetAdapter } from "../MeetAdapter.sol";

// @dev WARNING: This is for testing purposes only
contract MeetAdapterMock is MeetAdapter {
    constructor(address _token, address _lzEndpoint, address _delegate) MeetAdapter(_token, _lzEndpoint, _delegate) {}
}
