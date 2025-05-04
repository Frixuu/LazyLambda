// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.iterators.IteratorTaking;

final class Take {

    /**
        Returns an iterator that yields the first `n` items, or fewer, from the source iterator.
        @param src The source iterator.
        @param n The number of items to take.
        @return A new iterator.
    **/
    public static inline function take<T>(src: Iterator<T>, n: Int): Iterator<T> {
        return new IteratorTaking(src, n);
    }
}
