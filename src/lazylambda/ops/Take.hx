// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.iterators.IIterator;
import lazylambda.iterators.IteratorTaking;

final class Take {

    /**
        Returns an iterator that yields the first `n` items, or fewer, from the source iterator.
        @param src The source iterator.
        @param n The number of items to take.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function take<S: Iterator<T>, T>(
        src: S,
        n: Int
    ): IIterator<T> {
        return new IteratorTaking(src, n);
    }
}
