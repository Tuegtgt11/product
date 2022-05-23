<%@ page import="java.util.List" %>
<%@ page import="com.hellot2010aagain.product.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("listProduct");
    if (products == null){
        products = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../includes/head.jsp"></jsp:include>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="../includes/navbar.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <jsp:include page="../includes/sidebar.jsp"></jsp:include>
    <!-- /.Main Sidebar Container -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>List Product</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <!-- /.card -->
                        <a href="/admin/products/create">Create new Product</a>
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">List Product</h3>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Color</th>
                                        <th>Content</th>
                                        <th>Category</th>
                                        <th>Create At</th>
                                        <th>Update At</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%for (Product pd : products){%>
                                    <tr>
                                        <th><%=pd.getId()%></th>
                                        <th><%=pd.getName()%></th>
                                        <th><%=pd.getImage()%></th>
                                        <th><%=pd.getPrice()%></th>
                                        <th><%=pd.getQty()%></th>
                                        <th><%=pd.getColor_id()%></th>
                                        <th><%=pd.getContent()%></th>
                                        <th><%=pd.getCategory_id()%></th>
                                        <th><%=pd.getCreatedAt()%></th>
                                        <th><%=pd.getUpdatedAt()%></th>
                                        <th>
                                            <a href="/admin/products/detail?id=<%=pd.getId()%>"><i class="fas fa-arrow-circle-right"></i></a>
                                            <a href="/admin/products/edit?id=<%=pd.getId()%>"><i class="fa fa-pencil-alt"></i></a>
                                            <a href="/admin/products/delete?id=<%=pd.getId()%>" onclick="return confirm('Are you sure?')"><i class="fas fa-trash"></i></a>
                                        </th>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Color</th>
                                        <th>Content</th>
                                        <th>Category</th>
                                        <th>Create At</th>
                                        <th>Update At</th>
                                        <th>Action</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>
    <!-- Control Sidebar -->

    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<jsp:include page="../includes/script.jsp"></jsp:include>
</body>
</html>