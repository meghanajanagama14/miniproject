<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="API.aspx.cs" Inherits="API" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <form runat="server">
            <br /><br />
    <br /><br />
    <div>  
                <table>  
                    <tr>  
                        <td>  
                            <asp:Image ID="imgprofile" runat="server" Height="100px" Width="100px" /> </td>  
                    </tr>  
                    <tr>  
                        <td> Id </td>  
                        <td>  
                            <asp:Label ID="lblid" runat="server" Text=""></asp:Label>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td> Name </td>  
                        <td>  
                            <asp:Label ID="lblname" runat="server" Text=""></asp:Label>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td> Gender </td>  
                        <td>  
                            <asp:Label ID="lblgender" runat="server" Text=""></asp:Label>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td> locale </td>  
                        <td>  
                            <asp:Label ID="lbllocale" runat="server" Text=""></asp:Label>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td> link </td>  
                        <td>  
                            <asp:HyperLink ID="hylprofile" runat="server">Profile link</asp:HyperLink>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td> &nbsp;</td>  
                        <td>  
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>  
                    </tr>  
                    <tr>
                        <td><asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" /></td>
                    </tr>
                </table>  
        
            </div>
           </form>
    
</asp:Content>

