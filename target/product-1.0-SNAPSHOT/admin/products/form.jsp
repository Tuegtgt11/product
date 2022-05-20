<%@ page import="com.hellot2010aagain.product.entity.Product" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        Product product = (Product) request.getAttribute("product");
        int action = (int) request.getAttribute("action");
        HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
        String url = "/admin/products/create";
        if(action == 2){
            url = "/admin/products/edit";
        }
        if(errors == null){
            errors = new HashMap<>();
        }
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create Product</title>


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
                        <h1>Validation</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Validation</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- jquery validation -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Quick Example <small>jQuery Validation</small></h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <a href="/admin/products/list">Back to list</a>
                            <form id="quickForm" action="<%=url%>" method="post">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="id">Id</label>
                                        <input type="text" name="id" class="form-control" id="id" value="<%=product.getId()%>" placeholder="Please enter product's id!">
                                    </div><div class="form-group">
                                    <label for="fullName">FullName</label>
                                    <input type="text" name="fullName" class="form-control" id="fullName" value="<%=product.getFullName()%>" placeholder="Please enter product's fullName!">
                                </div>
                                    <div class="form-group">
                                        <label for="Price">Price</label>
                                        <input type="text" name="Price" class="form-control" id="Price" value="<%=product.getPrice()%>" placeholder="Please enter product's Price!">
                                    </div><div class="form-group">
                                    <label for="Thumbnail">Thumbnail</label>
                                    <input type="text" name="Thumbnail" class="form-control" id="Thumbnail" value="<%=product.getThumbnail()%>" placeholder="Please enter product's Thumbnail!">
                                </div>
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                    <input type="reset" class="btn btn-default" value="Reset">
                                </div>
                            </form>
                        </div>
                        <!-- /.card -->
                    </div>
                    <!--/.col (left) -->
                    <!-- right column -->
                    <div class="col-md-6">

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>

    <!-- Control Sidebar -->

    <!-- /.control-sidebar -->
</div>

</body>
</html>