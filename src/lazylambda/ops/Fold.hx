// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class Fold {

    public static inline function fold<T, R>(
        src: Iterator<T>,
        initial: R,
        operation: (acc: R, rhs: T) -> R
    ): R {
        var acc: R = initial;
        for (item in src) {
            acc = operation(acc, item);
        }
        return acc;
    }
}
