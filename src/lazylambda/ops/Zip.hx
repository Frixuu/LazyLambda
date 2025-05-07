// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.ds.Pair;
import lazylambda.iterators.IteratorZipping;

final class Zip {

    /**
        Returns an iterator of pairs built from items of two iterators at the same index.

        It has the length of the shortest of the two input iterators.
        @param left The left iterator.
        @param right The right iterator.
        @return A new iterator.
    **/
    public static extern inline overload function zip<T, U>(
        left: Iterator<T>,
        right: Iterator<U>
    ): Iterator<Pair<T, U>> {
        return new IteratorZipping(left, right);
    }
}
