<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cursor.ascx.cs" Inherits="Tuition_Center_Application.common.cursor" %>
<%--<link rel="stylesheet" href="https://unpkg.com/kursor/dist/kursor.css">
<script src="https://cdn.jsdelivr.net/npm/kursor@0.0.14/dist/kursor.js"></script>
<script>
    new kursor({
        type: 1,
        removeDefaultCursor: true, 
        color: '#90ff00',
    })
</script>--%>
<script src="https://cdn.blobity.dev/by.js?noAutoStart"></script>
<script>
    new Blobity({
        zIndex: 10000,
        opacity: 0.5,
        dotColor: 'rgb(59, 89, 153)',
        color: 'rgb(59, 89, 153)',
        radius: 10,
        fontSize: 14,
        fontColor: 'rgb(255, 255, 255)',
        mode: 'bouncy',
        focusableElementsOffsetX: 5,
        focusableElementsOffsetY: 5, 
    });
</script>