// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.Option;
import lazylambda.NoItemsException;

final class Reduce {

    /**
        Accumulates all of the source iterator's items into a single value, in order of iteration.
        @param src The source iterator.
        @param operation The folding function.
        @return The final value or `None` if the source iterator is empty.
    **/
    @:generic
    public static extern inline overload function reduce<S: Iterator<T>, T>(
        src: S,
        operation: (accumulator: T, item: T) -> T
    ): Option<T> {
    
        return if (src.hasNext()) {
            var accumulator: T = src.next();
            while (src.hasNext()) {
                accumulator = operation(accumulator, src.next());
            }
            Some(accumulator);
        } else {
            None;
        };
    }
    
    /**
        Accumulates all of the source iterator's items into a single value, in order of iteration.
        @param src The source iterator.
        @param operation The folding function.
        @return The final value or `null` if the source iterator is empty.
    **/
    @:generic
    public static extern inline overload function reduceOrNull<S: Iterator<T>, T>(
        src: S,
        operation: (accumulator: T, item: T) -> T
    ): Null<T> {
    
        return if (src.hasNext()) {
            var accumulator: T = src.next();
            while (src.hasNext()) {
                accumulator = operation(accumulator, src.next());
            }
            accumulator;
        } else {
            null;
        };
    }
    
    /**
        Accumulates all of the source iterator's items into a single value, in order of iteration.
        @param src The source iterator.
        @param operation The folding function.
        @return The final value.
        @throws NoItemsException if the source iterator is empty.
    **/
    @:generic
    public static extern inline overload function reduceOrThrow<S: Iterator<T>, T>(
        src: S,
        operation: (accumulator: T, item: T) -> T
    ): T {
    
        return if (src.hasNext()) {
            var accumulator: T = src.next();
            while (src.hasNext()) {
                accumulator = operation(accumulator, src.next());
            }
            accumulator;
        } else {
            throw new NoItemsException();
        };
    }
}
