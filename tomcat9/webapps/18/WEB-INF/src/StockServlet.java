
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class StockServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/event-stream");
        res.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();

        for (int i = 0; i < 100; i++) {
            double aapl = 150 + Math.random() * 5;
            double msft = 310 + Math.random() * 5;

            String json = String.format("{\"AAPL\": \"%.2f\", \"MSFT\": \"%.2f\"}", aapl, msft);
            out.write("data: " + json + "\n\n");
            out.flush();

            try { Thread.sleep(2000); } catch (InterruptedException e) { break; }
        }

        out.close();
    }
}
