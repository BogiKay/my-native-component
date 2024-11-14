import type {ViewProps} from 'react-native';
import type {HostComponent} from 'react-native';
import {DirectEventHandler} from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

type OnChangeEvent = {
  value: boolean;
};

export interface NativeProps extends ViewProps {
  value: boolean;
  onChange: DirectEventHandler<OnChangeEvent>;
}

export default codegenNativeComponent<NativeProps>(
  'CustomSwitchComponent',
) as HostComponent<NativeProps>;
