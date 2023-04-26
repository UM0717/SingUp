<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormDemo.aspx.cs" Inherits="SingUp.Views.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>姓名:</td>
                    <td><input type="text" id="txtName"/></td>
                </tr>
                <tr>
                    <td>年齡:</td>
                    <td><input type="text" id="txtAge"/></td>
                </tr>
                <tr>
                    <td>生日:</td>
                    <td><input type="text" id="txtBirthday"/></td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"><button type="button" id="btnAdd" value="add" onclick="addRow();">創建帳號</button></td>
<%--                    <td><button type="button" id="btnUpd" onclick="updRow();">修改帳號</button></td>--%>
                </tr>
            </table>

            
        </div>
        <table id="dataTable" border="1">
            <thead>
                <tr>
                    <th>姓名</th>
                    <th>年齡</th>
                    <th>生日</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </form>
    <script>
        var tableIndex;
        //var table = document.getElementById("dataTable"), rIndex;
        function addRow() {
            var value = document.getElementById("btnAdd").value;

            if (value == "add") {
                var name = document.getElementById("txtName").value;
                var age = document.getElementById("txtAge").value;
                var birthday = document.getElementById("txtBirthday").value;

                var table = document.getElementById("dataTable");
                var row = table.insertRow(-1);

                var nameCell = row.insertCell(0);
                var ageCell = row.insertCell(1);
                var birthdayCell = row.insertCell(2);
                var actionCell = row.insertCell(3);

                nameCell.innerHTML = name;
                ageCell.innerHTML = age;
                birthdayCell.innerHTML = birthday;
                actionCell.innerHTML = "<button onclick='editRow(this)'>修改</button> <button onclick='deleteRow(this)'>刪除</button>";


            } else {

                var table = document.getElementById("dataTable");
                table.rows[tableIndex].cells[0].innerHTML = document.getElementById("txtName").value;
                table.rows[tableIndex].cells[1].innerHTML = document.getElementById("txtAge").value;
                table.rows[tableIndex].cells[2].innerHTML = document.getElementById("txtBirthday").value;

                document.getElementById("btnAdd").value = "add";
                document.getElementById("btnAdd").innerText ="創建帳號";
            }


            document.getElementById("txtName").value = "";
            document.getElementById("txtAge").value = "";
            document.getElementById("txtBirthday").value = "";
        }

        function editRow(button) {
            
            var row = button.parentNode.parentNode;
            var nameCell = row.cells[0];
            var ageCell = row.cells[1];
            var birthdayCell = row.cells[2];
            var actionCell = row.cells[3];

            tableIndex = row.rowIndex;
            console.log(tableIndex);

            var name = nameCell.innerHTML;
            var age = ageCell.innerHTML;
            var birthday = birthdayCell.innerHTML;

            nameCell.innerHTML = name;
            ageCell.innerHTML = age ;
            birthdayCell.innerHTML = birthday;
            actionCell.innerHTML = "<button onclick='editRow(this)'>修改</button> <button onclick='deleteRow(this)'>刪除</button>";
            
            //nameCell.innerHTML = "<input type='text' value='" + name + "' />";
            //ageCell.innerHTML = "<input type='number' value='" + age + "' />";
            //birthdayCell.innerHTML = "<input type='date' value='" + birthday + "' />";
            //actionCell.innerHTML = "<button onclick='updateRow(this)'>Update</button> <button onclick='cancelEdit(this)'>Cancel</button>";
            document.getElementById("txtName").value = nameCell.innerHTML;
            document.getElementById("txtAge").value = ageCell.innerHTML;
            document.getElementById("txtBirthday").value = birthdayCell.innerHTML;

            document.getElementById("btnAdd").innerText ="修改帳號";
            document.getElementById("btnAdd").value = "edit";
            
        }
        function deleteRow(button) {
            var row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

        //function updRow() {

        //    var table = document.getElementById("dataTable");
        //    table.rows[tableIndex].cells[0].innerHTML = document.getElementById("txtName").value;
        //    table.rows[tableIndex].cells[1].innerHTML = document.getElementById("txtAge").value;
        //    table.rows[tableIndex].cells[2].innerHTML = document.getElementById("txtBirthday").value;
        //}
        //function updateRow(button) {
        //    var row = button.parentNode.parentNode;
        //    var nameCell = row.cells[0];
        //    var ageCell = row.cells[1];
        //    var birthdayCell = row.cells[2];
        //    var actionCell = row.cells[3];
            

        //    var name = nameCell.children[0].value;
        //    var age = ageCell.children[0].value;
        //    var birthday = birthdayCell.children[0].value;

        //    nameCell.innerHTML = name;
        //    ageCell.innerHTML = age;
        //    birthdayCell.innerHTML = birthday;
        //    actionCell.innerHTML = "<button onclick='editRow(this)'>Edit</button> <button onclick='deleteRow(this)'>Delete</button>";
        //}
    </script>
</body>
</html>
