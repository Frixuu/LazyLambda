// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class Fold {

    /**
        Accumulates all of the source iterator's items into a single value, in order of iteration.
        @param src The source iterator.
        @param initial The initial accumulator value.
        @param operation The folding function.
        @return The final value.
    **/
    public static inline function fold<T, R>(
        src: Iterator<T>,
        initial: R,
        operation: (accumulator: R, item: T) -> R
    ): R {
        var accumulator: R = initial;
        for (item in src) {
            accumulator = operation(accumulator, item);
        }
        return accumulator;
    }
}
