import { Amplify } from 'aws-amplify';
import config from './aws-exports';
import { generateClient } from '@aws-amplify/api';
import * as queries from './graphql/queries';

Amplify.configure(config);
const client = generateClient();

const allTodos = await client.graphql({query: queries.listTodos});

allTodos.data.listTodos.items.forEach(todo => {
    console.log(todo.title);
});

const getTodo = await client.graphql({query: queries.getTodo, variables: {id: '1'}});
console.log(getTodo);

const newTodo = await client.graphql({query: queries.createTodo, variables: {input: {title: 'New Todo', description: 'New Todo Description'}}});
console.log(newTodo);

const updatedTodo = await client.graphql({query: queries.updateTodo, variables: {input: {id: newTodo.id, title: 'Updated Todo', description: 'Updated Todo Description'}}});
console.log(updatedTodo);

const deletedTodo = await client.graphql({query: queries.deleteTodo, variables: {input: {id: newTodo.id}}});
console.log(deletedTodo);