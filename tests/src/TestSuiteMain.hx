// SPDX-License-Identifier: MIT
package;

import instrument.coverage.Coverage;
import utest.Runner;
import utest.ui.Report;

final class TestSuiteMain {

    private static function main() {
    
        final runner = new Runner();
        runner.onComplete.add(_ -> {
            Coverage.endCoverage();
        });
        
        runner.addCase(new CollectTest());
        runner.addCase(new CountTest());
        runner.addCase(new FilterTest());
        runner.addCase(new FoldTest());
        runner.addCase(new FirstTest());
        runner.addCase(new ForEachTest());
        runner.addCase(new JoinTest());
        runner.addCase(new MapTest());
        runner.addCase(new TakeTest());
        
        Report.create(runner);
        runner.run();
    }
}
