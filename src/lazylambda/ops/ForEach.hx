// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class ForEach {

    /**
        Runs the given action on each item in the source iterator.
        @param src The source iterator.
        @param action The function to run.
    **/
    public static extern inline overload function forEach<T>(
        src: Iterator<T>,
        action: (item: T) -> Void
    ): Void {
        for (item in src) {
            action(item);
        }
    }
    
    /**
        Runs the given action on each item in the source iterator, providing its index.
        @param src The source iterator.
        @param action The function to run.
    **/
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
