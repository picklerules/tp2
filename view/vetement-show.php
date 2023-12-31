{{ include('header.php', {title: 'Détails du vêtement sélectionné'}) }}
<body>
<h1>Détails du vêtement</h1>
    <div class="table-container">
        <table>
            <tr>
                <th>Nom</th>
                <th>Description</th>
                <th>Prix</th>
                <th>Vendeur</th> 
                <th>Supprimer</th> 
                <th>Modifier</th> 
            </tr>
            <tr>
                <td>{{ vetement.Nom }}</td>
                <td>{{ vetement.Description }}</td>
                <td>{{ vetement.Prix }}</td>
                <td>{{ nom }}</td> 
                <td>
                    <form action="{{path}}vetement/destroy" method="post">
                        <input type="hidden" name="id" value="{{vetement.ID}}">
                        <input type="submit" value="Delete" class="btn">
                    </form>
                </td>
                <td> 
                    <a href="{{path}}vetement/edit/{{ vetement.ID }}" class="btn">Modifier</a></td>
                </tr>
        </table>
    </div>
</body>
</html>
