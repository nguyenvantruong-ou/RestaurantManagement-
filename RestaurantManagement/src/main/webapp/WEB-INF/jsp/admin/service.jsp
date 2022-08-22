<%--
  Created by IntelliJ IDEA.
  User: Wall D
  Date: 4/22/2022
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="home">
    <h1 class="text-center">QUẢN LÍ DỊCH VỤ TIỆC CƯỚI</h1>
    <div class="">
        <form action="">
            <div class="box">
                <i class="fa fa-search" aria-hidden="true"></i>
                <input class="form-control" type="text" name="kw" placeholder="Nhập tên cần tìm...."/>
            </div>
        </form>
        <div>
            <a href="<c:url value="/admin/service/add" />"><input class="button button-edit" type="button" value="Thêm dịch vụ"/></a>
        </div>
        <table class="content-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên dịch vụ</th>
                    <th>Giá</th>
                    <th>Trạng thái</th>
                    <!--            <th>Mô tả</th>
                                <th>Ảnh</th>-->
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${services}">
                    <c:set value="black" var="color"/>
                    <c:if test="${s.serIsActive == false}">
                        <c:set value="red" var="color"/>
                    </c:if>
                    <tr>
                        <td style="color: ${color}">${s.id}</td>
                        <td style="color: ${color}">${s.serName}</td>
                        <td style="color: ${color}"><fmt:formatNumber value = "${s.serPrice}" type = "number"/> VND</td>
                        <c:if test="${s.serIsActive == true}">
                            <td style="color: ${color}">Còn hoạt động</td>
                        </c:if>
                        <c:if test="${s.serIsActive == false}">
                            <td style="color: ${color}">Ngưng hoạt động</td>
                        </c:if>
        <!--                <td>${s.serImage}</td>
                        <td>${s.serDescription}</td>-->
                        <td><a href="<c:url value="/admin/service/edit?id=${s.id}"/>"><input class="button button-edit" type="button" value="Sửa"/></a></td>
                        <td><a href="<c:url value="/admin/service/delete?id=${s.id}"/>"><input onclick="confirmForm(event)" class="button button-delete" type="button" value="Xoá"/></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>
<script>
    function confirmForm(e) {
        if (!confirm("Xác nhận xoá?"))
            e.preventDefault();
    }
</script>

