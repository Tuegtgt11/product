<%@ page import="com.hellot2010aagain.product.entity.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Product product = (Product) request.getAttribute("product");
  int action = (int) request.getAttribute("action");
  HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
  String url = "/admin/products/create";
  if(action == 2){
    url = "/admin/products/edit";
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
            <h1>General Form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
              <li class="breadcrumb-item active">Create Product</li>
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
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Create Product</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="<%=url%>" method="post">
                <div class="card-body">
                  <div class="form-group">
                    <label for="id">Id</label>
                    <input type="text" class="form-control" id="id" name="id" placeholder="Enter id" value="<%=product.getId()%>" <%=action == 2 ? "readonly":""%>>
                    <%if(errors.containsKey("id")){%>
                    <span class="text-danger">* <%=errors.get("id")%></span>
                    <%}%>
                  </div>
                  <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter name"  value="<%=product.getName()%>">
                    <%if(errors.containsKey("name")){%>
                    <span class="text-danger">* <%=errors.get("name")%></span>
                    <%}%>
                  </div>
                  <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" id="price" name="price" placeholder="Enter price" value="<%=product.getPrice()%>">
                    <%if(errors.containsKey("price")){%>
                    <span class="text-danger">* <%=errors.get("price")%></span>
                    <%}%>
                  </div>
                  <div class="form-group">
                    <label for="contents">Content</label>
                    <input type="text" class="form-control" id="contents" name="content" placeholder="Enter content" value="<%=product.getContent()%>">
                    <%if(errors.containsKey("content")){%>
                    <span class="text-danger">* <%=errors.get("content")%></span>
                    <%}%>
                  </div>
                  <%-- <div class="form-group">
                    <label for="size">Size</label>
                    <input type="text" class="form-control" id="size" name="size" placeholder="Enter size" value="<%=product.getSize()%>">
                    <%if(errors.containsKey("size")){%>
                    <span class="text-danger">* <%=errors.get("size")%></span>
                    <%}%>
                  </div>--%>
                  <div class="form-group">
                    <label for="qty">Quantity</label>
                    <input type="number" class="form-control" id="qty" name="qty" placeholder="Enter quantity" value="<%=product.getQty()%>">
                    <%if(errors.containsKey("qty")){%>
                    <span class="text-danger">* <%=errors.get("qty")%></span>
                    <%}%>
                  </div>
                  <%--<div class="form-group">
                    <label for="sku">Sku</label>
                    <input type="number" class="form-control" id="sku" name="sku" placeholder="Enter sku" value="<%=product.getSku()%>">
                    <%if(errors.containsKey("sku")){%>
                    <span class="text-danger">* <%=errors.get("sku")%></span>
                    <%}%>
                  </div>
                  <div class="form-group">
                  <label for="category">Category</label>
                  <input type="text" class="form-control" id="category" name="category" placeholder="Enter category" value="<%=product.getCategory()%>">
                    <%if(errors.containsKey("category")){%>
                    <span class="text-danger">* <%=errors.get("category")%></span>
                    <%}%>
                </div>
                  <div class="form-group">
                    <label for="tag">Tag</label>
                    <input type="text" class="form-control" id="tag" name="tag" placeholder="Enter tag" value="<%=product.getTag()%>">
                    <%if(errors.containsKey("tag")){%>
                    <span class="text-danger">* <%=errors.get("tag")%></span>
                    <%}%>
                  </div>--%>
                  <!-- /.form group -->
                  <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
                      </div>
                    </div>
                  </div>
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>

          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <!-- /.content-wrapper -->
  <jsp:include page="../includes/footer.jsp"></jsp:include>
  <!-- Control Sidebar -->

  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<jsp:include page="../includes/script.jsp"></jsp:include>
</body>
</html>
