package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet Filter implementation class FilterEnconding
 */
@WebFilter(filterName="FilterEnconding",
			urlPatterns="/*",
			initParams= {@WebInitParam(name="enconding",value="utf-8")})
public class FilterEnconding implements Filter {
	private String enconding;
	

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest=(HttpServletRequest) request;
		HttpServletResponse httpResponse=(HttpServletResponse) response;
		
		httpRequest.setCharacterEncoding(this.enconding);
		httpResponse.setCharacterEncoding(this.enconding);
		
		//System.out.println(DateUtil.show()+">>设置enconding"+this.enconding);
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.enconding=fConfig.getInitParameter("enconding");
	}

	@Override
	public void destroy() {
		
	}

}
