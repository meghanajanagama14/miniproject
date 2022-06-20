<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="getMail.aspx.cs" Inherits="Admin_getMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        

        table {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border: 1px solid #ccc;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br /><asp:GridView ID="gvEmails" runat="server" OnRowDataBound="OnRowDataBound" DataKeyNames="MessageNumber"
            AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="From" DataField="From" HtmlEncode="false" />
                <asp:TemplateField HeaderText="Subject">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" runat="server" Text='<%# Eval("Subject") %>' />
                        <span class="body" style="display: none">
                            <%# Eval("Body") %></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Date" DataField="DateSent" />
                <asp:TemplateField ItemStyle-CssClass="Attachments">
                    <ItemTemplate>
                        <asp:Repeater ID="rptAttachments" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkAttachment" runat="server" OnClick="Download" Text='<%# Eval("FileName") %>' />
                            </ItemTemplate>
                            <SeparatorTemplate>
                                <br />
                            </SeparatorTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div id="dialog" style="display: none">
            <span id="body"></span>
            <br />
            <span id="attachments"></span>
        </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/smoothness/jquery-ui.css" />
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $("[id*=lnkView]").click(function () {
                    var subject = $(this).text();
                    var row = $(this).closest("tr");
                    $("#body").html($(".body", row).html());
                    $("#attachments").html($(".Attachments", row).html());
                    $("#dialog").dialog({
                        title: subject,
                        width: 600,
                        buttons: {
                            Ok: function () {
                                $(this).dialog('close');
                            }
                        }
                    });
                    return false;
                });
            });
        </script>
    </form>
</body>
</html>
</asp:Content>

