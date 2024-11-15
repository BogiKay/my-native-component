import type {ViewProps} from 'react-native';
import type {HostComponent} from 'react-native';
import type {DirectEventHandler} from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

type OnChangeEvent = Readonly<{
  value: boolean;
}>;

type NativeEvent = {
  nativeEvent: OnChangeEvent;
};
export type CustomSwitchOnChange = (event: NativeEvent) => void;

export interface NativeProps extends ViewProps {
  value: boolean;
  onValueChange?: DirectEventHandler<OnChangeEvent>;
}

export default codegenNativeComponent<NativeProps>(
  'CustomSwitchComponent',
) as HostComponent<NativeProps>;
