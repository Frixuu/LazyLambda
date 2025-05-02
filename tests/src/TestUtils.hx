// SPDX-License-Identifier: MIT
package;

final class TestUtils {

    public static extern inline overload function isGreaterThan(a: Int, b: Int): Bool {
        return a > b;
    }
    
    public static extern inline overload function isLessThan(a: Int, b: Int): Bool {
        return a < b;
    }
}
