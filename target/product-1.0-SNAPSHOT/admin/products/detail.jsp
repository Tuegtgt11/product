<%@ page import="com.hellot2010aagain.product.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../includes/head.jsp"></jsp:include>
<body id="page-top">

<!-- Page Wrapper -->
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="../includes/navbar.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <jsp:include page="../includes/sidebar.jsp"></jsp:include>
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
                        <a href="/admin/products/create">Create new product</a> |
                        <a href="/admin/products/list">Back to list</a>
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Product Detail</h3>
                            </div>
                            <!-- /.card-header -->
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
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th><%=product.getId()%></th>
                                        <th><%=product.getName()%></th>
                                        <th><%=product.getImage()%></th>
                                        <th><%=product.getPrice()%></th>
                                        <th><%=product.getQty()%></th>
                                        <th><%=product.getColor_id()%></th>
                                        <th><%=product.getContent()%></th>
                                        <th><%=product.getCategory_id()%></th>
                                        <th><%=product.getCreatedAt()%></th>
                                        <th><%=product.getUpdatedAt()%></th>
                                        <th><%=product.getStatus()%></th>
                                    </tr>
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
                                        <th>Status</th>
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
<!-- End of Page Wrapper -->

<jsp:include page="../includes/script.jsp"></jsp:include>

</body>

</html>