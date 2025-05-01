// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class Count {

    public static extern inline overload function count<T>(src: Iterator<T>): Int {
        var count: Int = 0;
        for (item in src) {
            count += 1;
        }
        return count;
    }
    
    public static extern inline overload function count<T>(
        src: Iterator<T>,
        predicate: (T) -> Bool
    ): Int {
        var count: Int = 0;
        for (item in src) {
            if (predicate(item)) {
                count += 1;
            }
        }
        return count;
    }
}
