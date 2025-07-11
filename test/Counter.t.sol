// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    // FIXME: [PASS] test_Increment(bool) (runs: 256, μ: 22921, ~: 32167)
    function test_Increment(bool foo) public {
        if (foo) {
            counter.increment();
            assertEq(counter.number(), 1);
        } else {
            assertEq(counter.number(), 0);
        }
    }

    // FIXME: [PASS] testFuzz_SetNumber(bool,bool) (runs: 256, μ: 27256, ~: 32922)
    function testFuzz_SetNumber(bool bar, bool baz) public {
        counter.setNumber((bar ? 1 : 0) + (baz ? 1 : 0));
        assertGe(counter.number(), 0);
    }
}
