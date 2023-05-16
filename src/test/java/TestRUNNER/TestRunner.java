package TestRUNNER;

import org.junit.Test;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.Assert.*;
import org.junit.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.BeforeClass;


public class TestRunner {
    @Test
    public void testParallel() {
        Results results = Runner.path("C:/Users/FURKAN/Desktop/APITEST/KareteApiTest/src/test/java/features/post_StatusControl.feature").tags("~@ignore").
                parallel(1);
        //assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
        generateReport(results.getReportDir());
        //tags("~@ignore") -> feature ın içindeki bütün testleri aynı anda çalıştırır.
        //Raporlama yapmaya yarıyor.
    }
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "KarateApiTest");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
