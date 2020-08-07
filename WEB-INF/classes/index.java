import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class index extends HttpServlet {

	public void doGet(HttpServletRequest request,HttpServletResponse response)

       throws IOException, ServletException {

			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = new PrintWriter(response.getWriter(),true);

			try {

				out.println("<!Doctype html>");
				out.println("<html>");
				out.println("	<head>");
				out.println("		<title>Το Servlet index (.java)</title>");
				out.println("		<meta charset='UTF-8'>");
				out.println("		<style type='text/css'>");
				out.println("			body { background-color: #99FF99; font-family: Tahoma;}");
				out.println("			#header { text-align: center; color: #CC0000;}");
				out.println("			#main { text-align: center; }");
				out.println("			h2 { color: #CC0099; }");
				out.println("			span { color: #CC0000; }");
				out.println("		</style>");
				out.println("		");
				out.println("	</head>");
				out.println("	<body>");
				out.println("		<div id='header'>");
				out.println("			<img src='../images/DET_Logo_70.gif' alt='DMST logo' width='70' height='94'>			");
				out.println("			<h1>Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας</h1>");
				out.println("		</div>");
				out.println("		<div id='main'>");
				out.println("			<h2>*** Welcome from Servlet index ***</h2>");
				out.println("			<p>");
				out.println("				<strong>");
				out.println("						Πατήστε <a href='../index.html'>εδώ</a> για να μεταβείτε στη σελίδα <span>index</span>");
				out.println("				</strong>");
				out.println("			</p>");
				out.println("		</div>		");
				out.println("	</body>");
				out.println("</html>");

			} catch(Exception e) {
					out.println("Exception: " + e.getMessage());
					out.println("</body>");
					out.println("</html>");
			}
		}
}