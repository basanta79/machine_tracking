# Tracking

This application reads events from a rabbitmq queue and store them in a mariaDB database. 
This application has also an endpoint to retrieve events related with a specific machine and session.

## Open project
Import the main folder as a IntelliJ project.


## How to execute

1. Clone repository in your local machine, and move to root directory
2. Compile the application with ` $ mvn clean package`
3. Run database container with `cd docker-compose/db && docker-compose up -d  && cd .. && cd ..`
4. Run rabbitmq container with `cd docker-compose/queue && docker-compose up -d  && cd .. && cd ..`
5. Build the container for the application with `docker build --tag=tracking:latest .`
6. Run the app container with `docker build --tag=tracking:latest .  `

## How to test

The application has two endpoints to send messages to the queue.
The two possible events are sessions and events

To send a session to the queue:
`curl -X "POST" "http://localhost:8090/send/session?session_id=11111-1111-11112&machine_id=1111-2222-3333&start_at=1684327792" \
-H 'Content-Type: application/json; charset=utf-8' \
-d $'{}'`

To send an event to the queue
`curl -X "POST" "http://localhost:8090/send/events?session_id=11111-1111-11112&event_type=drivenDistance&numeric_event_value=1111&event_at=1684327792"`

Any request to those endpoints will create sessions and dummy events.

To retrieve the events created or any other events presents in the database:
`curl "http://localhost:8090/machines/1111-2222-3333/sessions/11111-1111-11112/events?session_id=11111-1111-11112&machine_id=1111-2222-3333&start_at=1684327792&pageNo=0&pageSize=2" \
-H 'Content-Type: application/json; charset=utf-8' \
-d $'{}'`
