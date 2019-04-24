;; Auto-generated. Do not edit!


(when (boundp 'i3dr_phobos::SetFloat)
  (if (not (find-package "I3DR_PHOBOS"))
    (make-package "I3DR_PHOBOS"))
  (shadow 'SetFloat (find-package "I3DR_PHOBOS")))
(unless (find-package "I3DR_PHOBOS::SETFLOAT")
  (make-package "I3DR_PHOBOS::SETFLOAT"))
(unless (find-package "I3DR_PHOBOS::SETFLOATREQUEST")
  (make-package "I3DR_PHOBOS::SETFLOATREQUEST"))
(unless (find-package "I3DR_PHOBOS::SETFLOATRESPONSE")
  (make-package "I3DR_PHOBOS::SETFLOATRESPONSE"))

(in-package "ROS")





(defclass i3dr_phobos::SetFloatRequest
  :super ros::object
  :slots (_data ))

(defmethod i3dr_phobos::SetFloatRequest
  (:init
   (&key
    ((:data __data) 0.0)
    )
   (send-super :init)
   (setq _data (float __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _data
       (sys::poke _data (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _data
     (setq _data (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass i3dr_phobos::SetFloatResponse
  :super ros::object
  :slots (_success _message ))

(defmethod i3dr_phobos::SetFloatResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass i3dr_phobos::SetFloat
  :super ros::object
  :slots ())

(setf (get i3dr_phobos::SetFloat :md5sum-) "96fbe2a49585a736ad8b4a31afbaf099")
(setf (get i3dr_phobos::SetFloat :datatype-) "i3dr_phobos/SetFloat")
(setf (get i3dr_phobos::SetFloat :request) i3dr_phobos::SetFloatRequest)
(setf (get i3dr_phobos::SetFloat :response) i3dr_phobos::SetFloatResponse)

(defmethod i3dr_phobos::SetFloatRequest
  (:response () (instance i3dr_phobos::SetFloatResponse :init)))

(setf (get i3dr_phobos::SetFloatRequest :md5sum-) "96fbe2a49585a736ad8b4a31afbaf099")
(setf (get i3dr_phobos::SetFloatRequest :datatype-) "i3dr_phobos/SetFloatRequest")
(setf (get i3dr_phobos::SetFloatRequest :definition-)
      "float32 data
---
bool success
string message
")

(setf (get i3dr_phobos::SetFloatResponse :md5sum-) "96fbe2a49585a736ad8b4a31afbaf099")
(setf (get i3dr_phobos::SetFloatResponse :datatype-) "i3dr_phobos/SetFloatResponse")
(setf (get i3dr_phobos::SetFloatResponse :definition-)
      "float32 data
---
bool success
string message
")



(provide :i3dr_phobos/SetFloat "96fbe2a49585a736ad8b4a31afbaf099")


