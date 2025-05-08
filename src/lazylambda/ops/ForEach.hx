// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class ForEach {

    /**
        Runs the given action on each item in the source iterator.
        @param src The source iterator.
        @param action The function to run.
    **/
    @:generic
    public static extern inline overload function forEach<S: Iterator<T>, T>(
        src: S,
        action: (item: T) -> Void
    ): Void {
        while (src.hasNext()) {
            action(src.next());
        }
    }
    
    /**
        Runs the given action on each item in the source iterator, providing its index.
        @param src The source iterator.
        @param action The function to run.
    **/
    @:generic
    public static extern inline overload function forEachIndexed<S: Iterator<T>, T>(
        src: S,
        action: (index: Int, item: T) -> Void
    ): Void {
        var index: Int = 0;
        while (src.hasNext()) {
            action(index, src.next());
            index += 1;
        }
    }
}
