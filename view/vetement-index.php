{{ include('header.php', {title: 'Liste des vêtements'}) }}
<body>
    <h1>Vêtements</h1>
    <div class="table-container">
        <table>
            <tr>
                <th>Nom</th>
                <th>Description</th>
                <th>Prix</th>
                <th>Vendeur</th> 
                <th>Delete</th>
            </tr>
            {% for vetement in vetements %}
                <tr>
                    <td><a href="{{path}}vetement/show/{{ vetement.ID }}">{{ vetement.Nom }}</a></td>
                    <td>{{ vetement.Description }}</td>
                    <td>{{ vetement.Prix }}</td>
                    <td>{{ vetement.NomVendeur }}</td> 
                    <td>
                        <form action="{{path}}vetement/destroy" method="post">
                            <input type="hidden" name="id" value="{{vetement.ID}}">
                            <input type="submit" value="Delete" class="btn">
                        </form>
                    </td>
                </tr>
            {% endfor %}
        </table>
    </div>
    <a href="{{path}}vetement/create" class="btn-add">Ajouter un vêtement</a>
</body>
</html>
