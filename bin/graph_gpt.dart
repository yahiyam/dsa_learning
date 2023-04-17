// import 'dart:collection';

// class Graph {
//   Map<int, List<int>> adjacencyList;

//   Graph(this.adjacencyList) {
//     adjacencyList = {};
//   }

//   void addVertex(int vertex) {
//     if (!adjacencyList.containsKey(vertex)) {
//       adjacencyList[vertex] = [];
//     }
//   }

//   void addEdge(int vertex1, int vertex2) {
//     if (!adjacencyList.containsKey(vertex1)) {
//       adjacencyList[vertex1] = [];
//     }
//     if (!adjacencyList.containsKey(vertex2)) {
//       adjacencyList[vertex2] = [];
//     }

//     adjacencyList[vertex1]?.add(vertex2);
//     adjacencyList[vertex2]?.add(vertex1);
//   }

//   void removeVertex(int vertex) {
//     if (!adjacencyList.containsKey(vertex)) {
//       return;
//     }

//     for (int v in adjacencyList[vertex]!) {
//       adjacencyList[v]?.remove(vertex);
//     }

//     adjacencyList.remove(vertex);
//   }

//   void removeEdge(int vertex1, int vertex2) {
//     if (!adjacencyList.containsKey(vertex1) ||
//         !adjacencyList.containsKey(vertex2)) {
//       return;
//     }

//     adjacencyList[vertex1]?.remove(vertex2);
//     adjacencyList[vertex2]?.remove(vertex1);
//   }

//   List<int> bfs(int startVertex) {
//     Queue<int> queue = Queue<int>();
//     Set<int> visited = <int>{};
//     List<int> result = [];

//     queue.add(startVertex);
//     visited.add(startVertex);

//     while (queue.isNotEmpty) {
//       // int vertex = queue.remove() as int;
//       result.add(vertex);

//       for (int neighbor in adjacencyList[vertex]!) {
//         if (!visited.contains(neighbor)) {
//           queue.add(neighbor);
//           visited.add(neighbor);
//         }
//       }
//     }

//     return result;
//   }

//   List<int> dfs(int startVertex) {
//     Set<int> visited = <int>{};
//     List<int> result = [];

//     void traverse(int vertex) {
//       visited.add(vertex);
//       result.add(vertex);

//       for (int neighbor in adjacencyList[vertex]!) {
//         if (!visited.contains(neighbor)) {
//           traverse(neighbor);
//         }
//       }
//     }

//     traverse(startVertex);

//     return result;
//   }
// }

// List<int> bfs(Graph graph, int startVertex) {
//   List<int> result = [];
//   Queue<int> queue = Queue<int>();
//   Set<int> visited = <int>{};

//   queue.add(startVertex);
//   visited.add(startVertex);

//   while (queue.isNotEmpty) {
//     int vertex = queue.remove() as int;
//     result.add(vertex);

//     for (int neighbor in graph.adjacencyList[vertex]!) {
//       if (!visited.contains(neighbor)) {
//         queue.add(neighbor);
//         visited.add(neighbor);
//       }
//     }
//   }

//   return result;
// }

// List<int> dfs(Graph graph, int startVertex) {
//   List<int> result = [];
//   Set<int> visited = <int>{};

//   void traverse(int vertex) {
//     visited.add(vertex);
//     result.add(vertex);

//     for (int neighbor in graph.adjacencyList[vertex]!) {
//       if (!visited.contains(neighbor)) {
//         traverse(neighbor);
//       }
//     }
//   }

//   traverse(startVertex);

//   return result;
// }
