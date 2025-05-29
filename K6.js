import http from 'k6/http';
import { check } from 'k6';

export let options = {
  stages: [
    { duration: '5s', target: 1000 },   // Sobe para 1.000 usuários em 5s
    { duration: '6s', target: 10000 },  // Sobe para 10.000 usuários em 6s
    { duration: '10s', target: 2000 },  // Reduz para 2.000 usuários em 10s
    { duration: '5s', target: 0 },      // Finaliza o teste
  ]
};

export default function () {
  let res = http.get('http://localhost:81');
  check(res, {
    'Status é 200': (r) => r.status === 200,
  });
}
