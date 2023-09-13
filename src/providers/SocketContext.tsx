'use client';

import { createContext } from 'react';

import type { SocketContextType } from './socket-provider';

export const SocketContext = createContext<SocketContextType>({
  socket: null,
  isConnected: false,
});
