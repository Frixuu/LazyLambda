// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.NoItemsException;

final class First {

    public static extern inline overload function firstOrThrow<T>(src: Iterator<T>): T {
    
        if (!src.hasNext()) {
            throw new NoItemsException();
        }
        
        return src.next();
    }
    
    public static extern inline overload function firstOrThrow<T>(
        src: Iterator<T>,
        predicate: (T) -> Bool
    ): T {
        return firstOrThrowPredicateImpl(src, predicate);
    }
    
    private static function firstOrThrowPredicateImpl<T>(
        src: Iterator<T>,
        predicate: (T) -> Bool
    ): T {
    
        while (src.hasNext()) {
            final item = src.next();
            if (predicate(item)) {
                return item;
            }
        }
        
        throw new NoItemsException();
    }
}
