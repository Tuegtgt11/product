<%@ page import="com.hellot2010aagain.product.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product = (Product)request.getAttribute("product");
%>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="${product.getFullName()} | Product detail"/>
</jsp:include>
<jsp:include page="../includes/menu.jsp"></jsp:include>
<a href="/admin/products/list">Back to list</a> &nbsp;
<a href="/admin/products/create">Create new product</a>
<div>
    Id: <%=product.getId()%>
</div>
<div>
    Name: <%=product.getName()%>
</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>