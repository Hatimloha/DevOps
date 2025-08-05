# Chef Commands

## 1. Runs the Chef client, which applies the configuration to the node.
```bash
chef-client
```
- Single recipe execute:
```bash
chef-client –zr "recipe[apache-cookbook::recipe3]"
```

- Multiple recipes execute:
```bash
chef-client –zr "recipe[test-cookbook::default], recipe[apache-cookbook::default]"
```

## 2. The Swiss Army knife of Chef, used for managing nodes, cookbooks, roles, environments, and more.
```bash
knife
```
- Upload a cookbook:
```bash
knife cookbook upload apache-cookbook
```

- Check uploaded files on server:
```bash
knife cookbook list
```
- Run list according to server (only recipes we want to run on a particular server will run):
```bash
knife node run-list set node1 "recipe[apache-cookbook::apache-recipe]"
```
- Delete a cookbook:
```bash
knife cookbook delete <cookbook name> -y
```
- To check the number of client nodes connected to the server:
```bash
knife node list
```
- Clients present on nodes that are connected to the server:
```bash
knife client list
```
- To delete a connected client from the server:
```bash
knife role delete <role-name> -y
```
- To delete a Chef role:
```bash
knife role delete <role-name> -y
```
- Upload the role on Chef server:
```bash
knife role from file /devops.rb
```
- To check roles stored in Chef server:
```bash
knife role list
```

## 3. Runs Chef in a standalone mode without a Chef server, useful for testing or simple deployments.
```bash
chef-solo
```
- Example usage:
```bash
sudo chef-solo -c solo.rb -j solo.json
```  
## 4. Interactive shell for exploring the Chef server API and testing recipes.
```bash
chef-shell
```

## 5. Applies a single recipe from the command line without a Chef server.
```bash
chef-apply
```
- Example usage (only when Chef server is not available):
```bash
chef-apply my_recipe.rb
```

## 6. Manages encrypted data bags using keys from a key/value store.
```bash
chef-vault
```
- Create a vault and add a file:
```bash
chef-vault create my_vault my_item --json '{"username": "admin", "password": "s3cr3t"}'
```

- To add an existing file to the vault:
```bash
chef-vault update my_vault my_item --json '{"username": "new_admin", "password": "new_s3cr3t"}'
```

- To check files inside a vault:
```bash
chef-vault show my_vault my_item
```

- To delete a file from the vault: 
```bash
chef-vault delete my_vault my_item
```

## 7. Controls the Chef server, including starting, stopping, reconfiguring, and managing services.
```bash
chef-server-ctl
```

## 8. Bootstraps a new node to be managed by Chef.
```bash
knife bootstrap
```
- Example usage (connect node with server):
```bash
knife bootstrap <private-ip> --ssh-user ec2-user --sudo -i node-key.pem -n node1
```
## 9. Command to ignore recipes which we don’t want to commit, similar to .gitignore.
```bash
chefignore
```
## 10. Testing cookbook to verify proper functionality without deploying on a live server ("demo run").
```bash
kitchen.yml
```
## 11. Information like name, version, author, etc., of the cookbook.
```bash
metadata.rb
```
## 12. Use this for opening existing files for changes.
```bash
.rb
```
## 13. Information about the usage of the cookbook.
```bash
README.md
```
## 14. Here we write code for recipes.
```bash
recipe
```
- Command to create a recipe:
```bash
chef generate recipe <recipe name>
```
## 15. Create a cookbook to store recipes.
```bash
cookbook
```
- Command to create a cookbook:
```bash
chef generate cookbook <cookbook name>
```
## 16. Unit testing.
```bash
spec
```
- Command to test a small part of the script (unit):
```bash
chef spec ruby -c test-cookbook/recipe/test-recipe.rb
```
## 17. Integration testing (entire).
```bash
test
```
- Command to run integration tests:
```bash
chef exec ruby -c test-cookbook/recipe/recipe2.rb
```

























