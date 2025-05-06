// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class ForEach {

    public static extern inline overload function forEach<T>(
        src: Iterator<T>,
        action: (item: T) -> Void
    ): Void {
        for (item in src) {
            action(item);
        }
    }
    
    public static extern inline overload function forEachIndexed<T>(
        src: Iterator<T>,
        action: (index: Int, item: T) -> Void
    ): Void {
        var index: Int = 0;
        for (item in src) {
            action(index, item);
            index += 1;
        }
    }
}
