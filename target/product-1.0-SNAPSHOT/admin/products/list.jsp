<%@ page import="java.util.List" %>
<%@ page import="com.hellot2010aagain.product.entity.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        List<Product> listProduct = (List<Product>)request.getAttribute("listProduct");
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List Product</title>

    <!-- Google Font: Source Sans Pro -->
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="../includes/header.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <jsp:include page="../includes/aside.jsp"></jsp:include>
    <!-- Content Wrapper. Contains page content -->

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>DataTables</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">DataTables</li>
                        </ol>
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
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">

                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>fullName</th>
                                        <th>Price</th>
                                        <th>Thumbnail</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <%for (Product st : listProduct) {
                                    %>
                                    <tbody>

                                    <th><%=st.getId()%></th>
                                    <th><%=st.getFullName()%></th>
                                    <th><%=st.getPrice()%></th>
                                    <th><%=st.getThumbnail()%></th>
                                    <th><a href="/admin/products/detail?id=<%=st.getId()%>">Detail</a>&nbsp;&nbsp;
                                        <a href="/admin/products/edit?id=<%=st.getId()%>">Edit</a>&nbsp;&nbsp;
                                        <a href="/admin/products/delete?id=<%=st.getId()%>" onclick="return confirm('Are you sure?')">Delete</a></th>
                                    </tbody>
                                    <%}%>
                                    <tfoot>
                                    <tr>
                                        <th>Id</th>
                                        <th>fullName</th>
                                        <th>Phone</th>
                                        <th>Thumbnail</th>
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


</body>
</html>
