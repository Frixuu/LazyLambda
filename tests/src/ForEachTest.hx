// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using TestUtils;
using lazylambda.Prelude;

class ForEachTest extends Test {

    public function spec__ForEach_is_called_exactly_once_for_each_item() {
        final src = (0...10);
        final values: Array<Int> = [];
        src.forEach(i -> values.push(i));
        Assert.same([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], values);
    }
    
    public function spec__ForEachIndexed_is_called_exactly_once_for_each_item() {
    
        final src = (10...20);
        final values: Array<String> = [];
        src.map(i -> Std.string(i)).forEachIndexed((i, item) -> values.push('$i: $item'));
        
        final expected = [
            "0: 10",
            "1: 11",
            "2: 12",
            "3: 13",
            "4: 14",
            "5: 15",
            "6: 16",
            "7: 17",
            "8: 18",
            "9: 19"
        ];
        
        Assert.same(expected, values);
    }
}
