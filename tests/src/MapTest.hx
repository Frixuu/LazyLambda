// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using TestUtils;
using lazylambda.Prelude;

class MapTest extends Test {

    public function spec__Map_operator_can_be_chained() {
    
        final iter = (1...10).map(i -> i + 1.5)
            .map(f -> Std.string(f))
            .map(s -> StringTools.lpad(s, "0", 4));
            
        Assert.equals("02.5", iter.next());
        Assert.equals("03.5", iter.next());
        Assert.equals("04.5", iter.next());
        Assert.equals("05.5", iter.next());
        Assert.equals("06.5", iter.next());
        Assert.equals("07.5", iter.next());
        Assert.equals("08.5", iter.next());
        Assert.equals("09.5", iter.next());
        Assert.equals("10.5", iter.next());
        Assert.equals("11.5", iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function spec__Values_can_be_extracted() {
    
        final map = ["foo" => 1, "bar" => 2, "baz" => 3];
        final iter = map.keyValueIterator().values();
        
        final values: Array<Int> = [];
        for (value in iter) {
            values.push(value);
        }
        
        values.sort((a, b) -> a - b);
        Assert.same([1, 2, 3], values);
    }
}
